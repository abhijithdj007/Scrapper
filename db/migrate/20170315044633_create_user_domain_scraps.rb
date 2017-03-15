class CreateUserDomainScraps < ActiveRecord::Migration[5.0]
  def change
    create_table :user_domain_scraps do |t|
      t.references :user, foreign_key: true
      t.references :domain, foreign_key: true
      t.integer :global_rank
      t.integer :india_rank

      t.timestamps
    end
  end
end
