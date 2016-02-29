class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.string :certification_name
      t.string :certification_authority
      t.string :certification_number
      t.string :certification_url

      t.timestamps null: false
    end
  end
end
