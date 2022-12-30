# Sample data to test it in Kibana console

	POST sample/_doc
	{
	  "name": "Thirumal 19",
	  "age" : "29",
	  "location": "Bangalore"
	}
	
	GET /sample/_search
	
	PUT /sample/_doc/_N2-2HQBcL4YgOAdFPHe
	{
	  "name": "Thirumal 129",
	  "age" : "29",
	  "location": "Bangalore"
	}
	
	GET _search
	{
	  "query": {
	    "match_all": "sample"
	  }
	}