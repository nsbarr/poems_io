class ChangeContentToText < ActiveRecord::Migration

  change_table :foobars do |t|  
          t.change :content, :text 
      end

end
