#' @export
# Define function for creating 'InterMineR' object
setQuery = function(
  select,
  orderBy,
  where,
  name = "",
  description = "",
  inheritQuery
){
  
  if(missing(inheritQuery)){
    
    # check the classes of select, name and description arguments
    argument.classes1 = c(class(select), class(name), class(description))
    
    if(!all(argument.classes1 == "character")){
      
      #ind1 = which(argument.classes1 != "character")
      ind1 = argument.classes1 != "character"
      
      message.error1 = paste0(
        "The following arguments are not of class 'character': ",
        paste(c("select", "name", "description")[ind1], collapse = ", ")
      )
      stop(message.error1)
    }
    
    # if orderBy is missing then the first element of the select argument is 
    # assigned to it
    if(missing(orderBy)){
      
      #if(class(where) != "list"){
      if(!is.list(where)){
        stop("where argument is not of class 'list'")
      }
      
      # set orderBy
      orderBy.value = "ASC"
      names(orderBy.value) = select[1]
      
      orderBy = list(orderBy.value)
      
    } else {
      
      # check the classes of orderBy and where
      argument.classes2 = c(class(orderBy), class(where))
      
      if(!all(argument.classes2 == "list")){
        
        #ind2 = which(argument.classes2 != "list")
        ind2 = argument.classes2 != "list"
        
        message.error2 = paste0(
          "The following arguments are not of class 'list': ",
          paste(c("orderBy", "where")[ind2], collapse = ", ")
        )
        stop(message.error2)
      }
    }
    
    # set query object of formal class 'InterMineR'
    query.object = new(
      "InterMineR",
      name = name,
      description = description,
      select = select,
      orderBy = orderBy,
      where = where
    )
    
  } else {
    
    # check every argument and replace where missing(argument) is TRUE
    if(!missing(select)){
      #if(class(select) != "character"){
      if(!is.character(select)){
        stop("select argument is not of class 'character'")
      } else {
        #inheritQuery$select = select
        inheritQuery[["select"]] = select
      }
    }
    #
    if(!missing(name)){
      #if(class(name) != "character"){
      if(!is.character(name)){
        stop("name argument is not of class 'character'")
      } else {
        #inheritQuery$name = name
        inheritQuery[["name"]] = name
      }
    }
    #
    if(!missing(description)){
      #if(class(description) != "character"){
      if(!is.character(description)){
        stop("description argument is not of class 'character'")
      } else {
        #inheritQuery$description = description
        inheritQuery[["description"]] = description
      }
    }
    #
    if(!missing(orderBy)){
      #if(class(orderBy) != "list"){
      if(!is.list(orderBy)){
        stop("orderBy argument is not of class 'list'")
      } else {
        #inheritQuery$orderBy = orderBy
        inheritQuery[["orderBy"]] = orderBy
      }
    }
    #
    if(!missing(where)){
      #if(class(where) != "list"){
      if(!is.list(where)){
        stop("where argument is not of class 'list'")
      } else {
        #inheritQuery$where = where
        inheritQuery[["where"]] = where
      }
    }
    # set query object of formal class 'InterMineR'
    query.object = new(
      "InterMineR",
      name = inheritQuery[["name"]],
      description = inheritQuery[["description"]],
      select = inheritQuery[["select"]],
      orderBy = inheritQuery[["orderBy"]],
      where = inheritQuery[["where"]]
    )
  }
  return(query.object)
}
