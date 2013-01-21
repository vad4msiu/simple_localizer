# encoding: UTF-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Product < ActiveRecord::Base
  translates :name
end

module Admin
  class Catalog < ActiveRecord::Base
    translates :name
  end
end

describe Admin::Catalog::Translation do
  it "должен правильно установить название таблици" do
    Admin::Catalog::Translation.table_name.should == 'catalog_translations'
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
    before(:each) do
      @translation = Product::Translation.new
    end

    it "не должен быть валидным если поле локали пустое" do
      @translation.valid?.should be_false
      @translation.errors['locale'].should be_include "can't be blank"
    end

    it "не должен быть валидным если поле для belongs_to связи не уникальное в скопе с полем locale" do
      Product::Translation.create!  :locale => 'ru', :product_id => 123, :name => 'asd'
      @translation.locale = 'ru'
      @translation.name = 'qwe'
      @translation.product_id = 123
      @translation.valid?.should be_false
      @translation.errors['locale'].should be_include "has already been taken"
    end

    it "должна работать предзагрузка ассоциаций" do
      Product::Translation.create!  :locale => 'ru', :product_id => 123, :name => 'asd'
      Product::Translation.includes(:product).first.should be_instance_of(Product::Translation)
    end
  end
end

describe Product do
  describe "после обвноления" do
    before(:each) do
      @product = Product.create! :name_ru => 'asd'
    end

    it "должен обновлять перевод" do
      @product.update_attributes :name_ru => 'qwe'
      @product.translations.first.name.should == 'qwe'
    end

    it "должен добавить новый перевод" do
      @product.translations.count.should == 1
      @product.update_attributes :name_en => 'qwe'
      @product.translations.count.should == 2
    end
  end

  describe "после создания" do
    before(:each) do
      @product = Product.create! :name_ru => 'asd'
    end

    it "должен создать несколько переводов" do
      product = Product.create! :name_ru => 'asd', :name_en => 'asd'
      product.translations.count.should == 2
    end

    it "должен создать перевод с заданной локалью" do
      @product.translations.count.should == 1
    end

    it "локаль в созданном переводе должна равняться заданной при создании" do
      @product.translations.first.locale.should == 'ru'
    end

    it "значение в переводе должено равняться переданному при создании" do
      @product.translations.first.name.should == 'asd'
    end
  end

  it "должен отдать с fallback локалью" do
    I18n::Backend::Simple.include(I18n::Backend::Fallbacks)
    I18n.fallbacks[:ru] = [:ru, :en, :fr]
    product = Product.create! :name_fr => 'asd', :name_ru => nil, :name_en => nil
    product.name_ru.should == 'asd'
  end

  it "должен создать перевод с локалью I18n.default_locale" do
    product = Product.create! :name => 'asd'
    product.translations.first.locale == I18n.default_locale
  end
end
