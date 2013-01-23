<% underscore_name = model_name.underscore.gsub("/", "_") -%>
<% table_name      = ":#{underscore_name}_translations" -%>
<% foreign_key     = ":#{underscore_name}_id" -%>
class Create<%= underscore_name.camelize -%>Translations < ActiveRecord::Migration
  def change
    create_table <%= table_name -%> do |t|
      t.string :locale, :null => false
      t.integer <%=  foreign_key -%>
      <% fields.each_pair do |column, type| %>
      t.<%= type %> <%= ":#{column}" -%>
      <% end %>

      t.timestamps
    end

    <%- random_string = proc { (0...20).map{ ('a'..'z').to_a[rand(26)] }.join } -%>
    <%- options = ActiveRecord::Migration.index_name(table_name, foreign_key).size > 64 ? { :name => random_string.call } : {} -%>
    add_index <%= table_name -%>, <%= foreign_key %>, <%= p(options) %>
    <%- options = ActiveRecord::Migration.index_name(table_name, :locale).size > 64 ? { :name => random_string.call } : {} -%>
    add_index <%= table_name -%>, :locale, <%= p(options) %>
    <%- options = ActiveRecord::Migration.index_name(table_name, [:locale, foreign_key]).size > 64 ? { :name => random_string.call } : {} -%>
    add_index <%= table_name -%>, [:locale, <%= foreign_key -%>], <%= p(options.merge(:unique => true)) %>
  end
end