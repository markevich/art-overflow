namespace :setup do
  task :drop_database do
    puts "*** Drop old database ***"
    Rake::Task['db:drop'].invoke
  end

  task :create_database do
    puts "*** Create new database ***"
    Rake::Task['db:create'].invoke
  end

  task :migrate_database do
    puts "*** Do migrations ***"
    Rake::Task['db:migrate'].invoke
  end

  task :seed_database do
    puts "*** Seeding database ***"
    Rake::Task['db:seed'].invoke
  end

  task :create_test_database do
    puts "*** Setup test database ***"
    Rake::Task['db:test:prepare'].invoke
  end

  task :create_user do
    puts "*** Create example@example.com/password user ***"
    User.create(email: 'example@example.com',
                password: 'password',
                password_confirmation: 'password',
                confirmed_at: DateTime.now
    )
  end
end

task :setup => :environment do
  Rake::Task['setup:drop_database'].invoke
  Rake::Task['setup:create_database'].invoke
  Rake::Task['setup:migrate_database'].invoke
  Rake::Task['setup:seed_database'].invoke
  Rake::Task['setup:create_test_database'].invoke
end
