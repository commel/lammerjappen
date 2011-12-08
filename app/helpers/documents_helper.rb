module DocumentsHelper
  
  def available(document)
    document.available ? "available" : "blocked"    
  end
  
end
