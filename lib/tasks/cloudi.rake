namespace :cloudi do

  desc "migrate all photos wich exists of Post on Cloudinarines"
  task cloudi_1: :environment do
      migrator = Cloudinary::Migrator.new(
        :retrieve=>proc{|id| User.find(id).data },
        :complete=>proc{|id, result| $stderr.print "done \#{id} \#{result}\n" }
        )

      User.find_each(:conditions=>["id > ?", migrator.max_given_id], :select => "id") do
        |post|
        migrator.process(:id => user.id, :public_id => "user_\#{post.id}")
      end
      migrator.done
  end

end
