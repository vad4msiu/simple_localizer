# encoding: UTF-8

require "active_record"

module Localizer
  SUPPORTED_LOCALES = %w(
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
      underscore_name   = name.underscore
      translation_class = const_set(:Translation, Class.new(ActiveRecord::Base))
      translated_attribute_names = columns.map &:to_s

      translation_class.table_name = "#{underscore_name}_translations"
      translation_class.belongs_to underscore_name
      translation_class.validates *translated_attribute_names, :presence => true
      translation_class.validates :locale, :presence => true
      translation_class.validates :locale, :uniqueness => { :scope => ["#{underscore_name}_id"] }

      has_many :translations, :class_name => translation_class.name, :dependent => :destroy

      translated_attribute_names.each do |attr|
        define_method attr do
          locale = I18n.default_locale.to_s
          translations.detect { |translation|
            translation.locale == locale
          }.try(attr)
        end

        define_method "#{attr}=" do |value|
          locale = I18n.default_locale.to_s
          translation = translations.detect { |translation| translation.locale == locale }
          translation ||= translations.build :locale => locale
          translation.send("#{attr}=", value)
        end

        Localizer::SUPPORTED_LOCALES.each do |locale|
          define_method "#{attr}_#{locale}" do
            translation = translations.detect { |translation|
              translation.locale == locale
            }.try(attr)
          end

          define_method "#{attr}_#{locale}=" do |value|
            translation = translations.detect { |translation| translation.locale == locale }
            translation ||= translations.build :locale => locale
            translation.send("#{attr}=", value)
          end
        end
      end
    end
  end
end

ActiveRecord::Base.extend Localizer::ClassMethods