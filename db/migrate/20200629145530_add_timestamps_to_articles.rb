class AddTimestampsToArticles < ActiveRecord::Migration[6.0]
  def change
    # we had only the change method 
    #          :name of the table, :attribute name, :data_type
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
