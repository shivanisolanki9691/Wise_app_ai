class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    unless table_exists?(:accounts)
    create_table :accounts do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :otp

      t.timestamps
    end
    end
  end
end
