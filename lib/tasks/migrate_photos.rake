
desc "Envoi des images sur cloudinarines"
  task cloudi: :environment do
    migrator = Cloudinary::Migrator.new(
      :retrieve=>proc{|id| Post.find(id).data },
      :complete=>proc{|id, result| $stderr.print "done \#{id} \#{result}\n" }
      )

    Post.find_each(:conditions=>["id > ?", migrator.max_given_id], :select => "id") do
      |post|
      migrator.process(:id => post.id, :public_id => "post_\#{post.id}")
    end
    migrator.done
  end
