Class klAPI.spec Extends %REST.Spec [ ProcedureBlock ]
{

XData OpenAPI [ MimeType = application/json ]
{
{
  "swagger":"2.0",
  "info":{
    "description":"An API for query Kates library in InterSystems IRIS",
    "version":"1.0.0",
    "title":"Kate Library API",
    "license":{
      "name":"Apache 2.0",
      "url":"http://www.apache.org/licenses/LICENSE-2.0.html"
    }
  },
  "schemes":[
    "https"
  ],
  "paths":{
    "/allcompanies":{
      "get":{
        "description":"Returns all companies\n",
        "operationId":"QueryAllCompany",
        "produces":[
          "application/json"
        ],
        "parameters":[
        ],
        "responses":{
          "200":{
            "description":"Success"
          },
          "500":{
            "description":"Server error"
          }
        }
      }
    },
    "/newcompany":{
      "post":{
        "description":"Add a new compnay to the library. Company Name and WebURL must be provided in the request body. Returns new company\n",
        "operationId":"NewCompany",
        "produces":[
          "application/json"
        ],
        "parameters":[
          {
            "in":"body",
            "name":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Company"
            }
          },
          {
            "name":"prod",
            "in":"query",
            "required":false,
            "type":"boolean"
          }
        ],
        "responses":{
          "200":{
            "description":"Success"
          },
          "400":{
            "description":"Invalid message body"
          },
          "500":{
            "description":"Server error"
          }
        }
      }
    },
    "/company":{
      "get":{
        "description":"Get the company from the list by given ID and data. Returns company\n",
        "operationId":"QueryCompanyById",
        "produces":[
          "application/json"
        ],
        "parameters":[
          {
            "name":"id",
            "in":"query",
            "description":"CompanyId",
            "required":true,
            "type":"integer"
          },
          {
            "name":"prod",
            "in":"query",
            "required":false,
            "type":"boolean"
          }
        ],
        "responses":{
          "200":{
            "description":"Success"
          },
          "404":{
            "description":"Company not found"
          },
          "500":{
            "description":"Server error"
          }
        }
      },
      "post":{
        "description":"Update existing company given ID and data. Returns updated company\n",
        "operationId":"EditCompanyById",
        "produces":[
          "application/json"
        ],
        "parameters":[
          {
            "name":"id",
            "in":"query",
            "description":"CompanyId",
            "required":true,
            "type":"integer"
          },
          {
            "in":"body",
            "name":"body",
            "description":"Company Info",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Company"
            }
          },
          {
            "name":"prod",
            "in":"query",
            "required":false,
            "type":"boolean"
          }
        ],
        "responses":{
          "200":{
            "description":"Success"
          },
          "400":{
            "description":"Invalid message body"
          },
          "404":{
            "description":"Company not found"
          },
          "500":{
            "description":"Server error"
          }
        }
      },
      "delete":{
        "description":"Delete existing company given ID. Returns deleted company\n",
        "operationId":"RemoveCompanyById",
        "produces":[
          "application/json"
        ],
        "parameters":[
          {
            "name":"id",
            "in":"query",
            "description":"CompanyId",
            "required":true,
            "type":"integer"
          },
          {
            "name":"prod",
            "in":"query",
            "required":false,
            "type":"boolean"
          }
        ],
        "responses":{
          "200":{
            "description":"Success"
          },
          "404":{
            "description":"Company not found"
          }
        }
      }
    }
  },
  "definitions":{
    "Company":{
      "type":"object",
      "properties":{
        "Name":{
          "type":"string"
        },
        "WebURL":{
          "type":"string"
        },
        "Description":{
          "type":"string"
        },
        "Remark":{
          "type":"string"
        },
        "EstablishYear":{
          "type":"integer"
        }
      }
    }
  }
}
}

}