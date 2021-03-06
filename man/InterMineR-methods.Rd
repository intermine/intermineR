\name{InterMineR-methods}
\docType{methods}

\alias{InterMineR-methods}
\alias{getName}
\alias{getName-methods}
\alias{getName,InterMineR-method}
\alias{getDescription}
\alias{getDescription-methods}
\alias{getDescription,InterMineR-method}
\alias{getSelect}
\alias{getSelect-methods}
\alias{getSelect,InterMineR-method}
\alias{getOrderBy}
\alias{getOrderBy-methods}
\alias{getOrderBy,InterMineR-method}
\alias{getWhere}
\alias{getWhere-methods}
\alias{getWhere,InterMineR-method}

\title{
Methods for accessing \code{\link{InterMineR-class}} objects.
}

\description{
InterMineR constitutes a class used to store the information which are required for performing a query for biological data in an InterMine instance. The methods for accessing the slots of an InterMineR-class object are presented here.
}

\section{Methods}{
  \bold{Class-specific methods:}
  \describe{
     
     \item{\code{getName(InterMineR-class)}:}{
     Access the name slot of \code{InterMineR-class} object.
     }
     
     \item{\code{getDescription(InterMineR-class)}:}{
     Access the description slot of \code{InterMineR-class} object.
     }
     
     \item{\code{getSelect(InterMineR-class)}:}{
     Access the select slot of \code{InterMineR-class} object.
     }
     
     \item{\code{getOrderBy(InterMineR-class)}:}{
     Access the orderBy slot of \code{InterMineR-class} object.
     }
     
     \item{\code{getWhere(InterMineR-class)}:}{
     Access the where slot of \code{InterMineR-class} object.
     }
     
  }
}

\author{
InterMine Team
}

\seealso{
\code{\link{setConstraints}}, \code{\link{setQuery}}, \code{\link{InterMineR-class}}
}

\examples{
# get mine instance
im.fly = initInterMine(listMines()["FlyMine"])

# get GO_Gene template query
qGO_Gene = getTemplateQuery(im.fly, "GO_Gene")

# create 'InterMineR' object
go.query = setQuery(
  inheritQuery = qGO_Gene
)

class(go.query)

# access name:
getName(go.query)

# access description:
getDescription(go.query)

# access select:
getSelect(go.query)

# access orderBy:
getOrderBy(go.query)

# access where:
getWhere(go.query)

}
