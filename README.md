# Localizer

Simple localization your ActiveRecord fields without magic.

## Installation

```ruby
source 'https://rubygems.org'

gem 'simple-localizer'
```

## Model translations

```ruby
class Product < ActiveRecord::Base
  translates :name
end
```

```ruby
product = Product.create! :name_en => 'a'
puts product.name_en # => a
product.name_en = 'b'
product.save!
puts product.name_en # => b
product.update_attributes :name_en => 'c'
puts product.name_en # => c

I18n.default_locale = :en
product = Product.create! :name => 'd'
puts product.name # => d
puts product.name_en # => d
```

## Supported locales

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