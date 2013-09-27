class ChangeDataTypeForSessionId < ActiveRecord::Migration
  def self.up
  	change_table :carts do |t|
      t.change :session_id, :text
    end
  end
end
