class UpdateTypeTableColumnsFromArticles < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :created_at, :datetime
    change_column :articles, :updated_at, :datetime
  end
end
