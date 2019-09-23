class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.string :email, index: true, unique: true, null: false, default: '', limit: 140
      t.string :password_digest, null: false, default: ''
      t.string :google_secret, default: ''

      t.timestamps
    end
  end
end
