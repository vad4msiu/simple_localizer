# encoding: UTF-8

require "active_record"

module SimpleLocalizer
  @@supported_locales = %w(
    aa ab ae af al am ar as ay az
    ba be bg bh bi bn bo bp br ca
    cf ch co cs cy de dr dt dz ef
    eg ej el en eo ep er es et eu
    fa fi fj fo fr fy ga gd gl gn
    gu ha he hi hm hr hu hy ia ie
    ik in is it iw ja ji jv ka kk
    kl km kn ko ks ku ky la ln lo
    lt lv mg mi mk ml mn mo mr ms
    mt my na ne nl no nt oc of og
    om or pa pl pn ps pt qu re rm
    rn ro ru rw sa sd sf sg sh si
    sk sl sm sn so sq sr ss st su
    sv sw ta te tg th ti tj tk tl
    tn to tp tr ts tt tw uk ul ur
    uz vi vo wo xh yo zh zu
  )

  module ClassMethods
    def translates *columns
      translated_attribute_names = columns.map &:to_s

      unless const_defined? :Translation
        underscore_name = name.underscore.gsub("/", "_").to_sym
        foreign_key     = "#{underscore_name}_id".to_sym

        translation_class = const_set(:Translation, Class.new(ActiveRecord::Base))

        translation_class.table_name = "#{underscore_name}_translations"
        translation_class.belongs_to(underscore_name, # WORKAROUND Rails prefers association name to be symbol
          :class_name  => self.name,
          :foreign_key => foreign_key,
          :touch       => true
        )
        translation_class.validates :locale, :presence => true
        translation_class.validates underscore_name, :presence => true
        translation_class.validates :locale, :uniqueness => { :scope => foreign_key }

        has_many(:translations,
          :dependent   => :destroy,
          :autosave    => true,
          :class_name  => translation_class.name,
          :inverse_of  => underscore_name,
          :foreign_key => foreign_key
        )
      end

      translated_attribute_names.each do |attr|
        define_method attr do
          locale = SimpleLocalizer.read_locale
          translation = send("#{attr}_#{locale}")

          if I18n.respond_to?(:fallbacks) && translation.blank?
            fallbacks_locales = I18n.fallbacks[locale].dup.map(&:to_s)

            while translation.blank? && fallbacks_locales.present? do
              locale = fallbacks_locales.shift
              translation = send("#{attr}_#{locale}")
            end
          end

          translation
        end

        define_method "#{attr}=" do |value|
          locale = SimpleLocalizer.read_locale
          send("#{attr}_#{locale}=", value)
        end

        # I use method 'detect'. This is not the fastest solution, but it is simple.
        # If you have many entries for 'translations' association and this piece of code slows down,
        # you can use the hash, but then do not forget to take care of cleaning it when call the method 'reload' for model.
        SimpleLocalizer.supported_locales.each do |locale|
          define_method "#{attr}_#{locale}" do
            translation = translations.detect { |translation|
              translation.locale == locale
            }

            translation.try(attr)
          end

          define_method "#{attr}_#{locale}=" do |value|
            translation = translations.detect { |translation|
              translation.locale == locale
            }
            translation ||= translations.build :locale => locale
            translation.send("#{attr}=", value)
          end
        end
      end
    end
  end

  module_function

  def supported_locales
    @@supported_locales
  end

  def supported_locales=(value)
    @@supported_locales = value
  end

  def with_locale(new_locale, &block)
    begin
      pre_locale = Thread.current[:simple_localizer_locale]
      set_locale(new_locale)
      yield
    ensure
      set_locale(pre_locale)
    end
  end

  def read_locale
    (Thread.current[:simple_localizer_locale] || I18n.locale || I18n.default_locale).to_s
  end

  private

  module_function

  def set_locale(locale)
    Thread.current[:simple_localizer_locale] = locale && locale.to_s
  end

end

ActiveRecord::Base.extend SimpleLocalizer::ClassMethods
