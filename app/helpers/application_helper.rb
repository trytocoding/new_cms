module ApplicationHelper
	  
  def current_user
    @user ||=User.find(session[:user_id]) if session[:user_id]
  end
   
   def admin?
     if current_user && current_user.role == "admin"
       true
     else 
       false
     end
   end
   
    def book_moderator?
     if current_user && current_user.role == "books_moderator"
       true
     else 
       false
     end
   end

   def news_moderator?
     if current_user && current_user.role == "news_moderator"
       true
     else 
       false
     end
   end

   def char_moderator?
     if current_user && current_user.role == "char_moderator"
       true
     else 
       false
     end
   end

   def cm_moderator?
     if current_user && current_user.role == "cm_moderator"
       true
     else 
       false
     end
   end

end
