# encoding: UTF-8

require File.expand_path('../spec_helper', __FILE__)

describe "проверяем всякие штуки с неймспейсами" do
  describe Food::Restaurant do
    it "должна быть доступна связь translations" do
      owner = Food::Restaurant.create! :name => 'asd'
      expect {
        owner.translations
      }.to_not raise_error
    end
  end

  describe Food::Restaurant::Translation do
    it "должна быть доступна связь admin_catalog" do
      translation = Food::Restaurant::Translation.create!(
        :locale             => 'ru',
        :food_restaurant_id => Food::Restaurant.create!.id,
        :name               => 'asd'
      )

      expect {
        translation.food_restaurant
      }.to_not raise_error
    end
  end

  describe Admin::Catalog do
    it "должна быть доступна связь translations" do
      owner = Admin::Catalog.create! :name => 'asd'
      expect {
        owner.translations
      }.to_not raise_error
    end
  end

  describe Admin::Catalog::Translation do
    it "должна быть доступна связь admin_catalog" do
      translation = Admin::Catalog::Translation.create!(
        :locale           => 'ru',
        :admin_catalog_id => Admin::Catalog.create!.id,
        :name             => 'asd'
      )

      expect {
        translation.admin_catalog
      }.to_not raise_error
    end
  end

  describe Legacy::Service do
    it "должна быть доступна связь translations" do
      owner = Legacy::Service.create! :name => 'asd'
      expect {
        owner.translations
      }.to_not raise_error
    end
  end

  describe Legacy::Service::Translation do
    it "должна быть доступна связь legacy_service" do
      translation = Legacy::Service::Translation.create!(
        :locale            => 'ru',
        :legacy_service_id => Legacy::Service.create!.id,
        :name              => 'asd'
      )

      expect {
        translation.legacy_service
      }.to_not raise_error
    end
  end
end

describe SimpleLocalizer do
  it "должен выполнить блок с установленным языком" do
    product = Product.create! :name_fr => 'qwe', :name_en => 'asd'
    SimpleLocalizer.with_locale(:fr) do
      product.name.should == 'qwe'
    end
  end
end

describe Product::Translation do
  describe "валидация" do
    let(:translation) { Product::Translation.new }
    let(:product) { Product.create! }

    it "не должен быть валидным если поле локали пустое" do
      translation.valid?.should be_false
      translation.errors['locale'].should be_include "can't be blank"
    end

    it "не должен быть валидным если поле для belongs_to связи не уникальное в скопе с полем locale" do
      Product::Translation.create!(
        :locale     => 'ru',
        :product_id => product.id,
        :name       => 'asd'
      )
      translation.locale     = 'ru'
      translation.name       = 'qwe'
      translation.product_id = product.id
      translation.valid?.should be_false
      translation.errors['locale'].should be_include "has already been taken"
    end

    it "должна работать предзагрузка ассоциаций" do
      Product::Translation.create!(
        :locale     => 'ru',
        :product_id => product.id,
        :name       => 'asd'
      )
      expect {
        Product::Translation.includes(:product)
      }.to_not raise_error
    end
  end
end

describe Product do
  let(:product) { Product.create! :name_ru => 'asd' }

  it "должен поддерживать повтороный вызов translates" do
    expect {
      product.update_attributes(
        :name_ru        => 'qwe',
        :description_ru => 'asd'
      )
    }.to raise_error

    Product.translates :description

    expect {
      product.update_attributes(
        :name_ru        => 'qwe',
        :description_ru => 'asd'
      )
    }.to_not raise_error
  end

  describe "после обвноления" do
    it "должен обновлять перевод" do
      product.update_attributes :name_ru => 'qwe'
      product.translations.where(:locale => 'ru').first.name.should == 'qwe'
    end

    it "должен добавить новый перевод" do
      product.translations.count.should == 1
      product.update_attributes :name_en => 'qwe'
      product.translations.count.should == 2
    end
  end

  describe "после создания" do
    it "должен создать несколько переводов" do
      Product.create!(
        :name_ru => 'asd',
        :name_en => 'asd'
      ).translations.count.should == 2
    end

    it "должен создать перевод с заданной локалью" do
      product.translations.count.should == 1
    end

    it "локаль в созданном переводе должна равняться заданной при создании" do
      product.translations.first.locale.should == 'ru'
    end

    it "значение в переводе должено равняться переданному при создании" do
      product.translations.first.name.should == 'asd'
    end
  end

  it "должен отдать с fallback локалью" do
    I18n::Backend::Simple.include(I18n::Backend::Fallbacks)
    I18n.fallbacks[:ru] = [:ru, :en, :fr]
    product = Product.create!(
      :name_fr => 'asd',
      :name_ru => nil,
      :name_en => nil
    )

    product.name_ru.should == nil

    SimpleLocalizer.with_locale(:fr) do
      product.name.should == 'asd'
    end
  end

  it "должен создать перевод с локалью I18n.locale" do
    Product.create!(
      :name => 'asd'
    ).translations.first.locale == I18n.locale
  end

  context 'когда I18n.locale не установлен' do
    it "должен создать перевод с локалью I18n.default_locale" do
      Product.create!(
        :name => 'asd'
      ).translations.first.locale == I18n.default_locale
    end

  end
end

describe "генерация миграций" do
  pending
end
