class RemoveConstraintFromPostSub < ActiveRecord::Migration
  def change
    remove_column :post_subs, :sub_id
    remove_column :post_subs, :post_id
    add_column :post_subs, :sub_id, :integer
    add_column :post_subs, :post_id, :integer
  end
end
