<% original_name = model_name.constantize.table_name.singularize -%>
<% table_name = ":#{original_name}_translations" -%>
<% owner_id   = ":#{original_name}_id" -%>
class Create<%= original_name.gsub("::", "").camelcase -%>Translations < ActiveRecord::Migration
  def change
    create_table <%= table_name -%> do |t|
      t.string :locale, :null => false
      t.integer <%=  owner_id -%>
      <% fields.each_pair do |column, type| %>
      t.<%= type %> <%= ":#{column}" -%>
      <% end %>

      t.timestamps
    end

    add_index <%= table_name -%>, <%= owner_id %>
    add_index <%= table_name -%>, :locale
    add_index <%= table_name -%>, [:locale, <%= owner_id -%>], :unique => true
  end
end
