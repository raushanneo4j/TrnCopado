[
  {
    "id": "C1",
    "icon": {
      "fileName": "psa_project",
      "namespace": "pse"
    },
    "name": "Opportunity to Services Project",
    "description": "This flow describes the best practice to use while moving from Opportunities to Project creation and fulfilment with FinancialForce PSA.",
    "stepType": "PROCESS",
    "steps": [
      "B1",
      "B2",
      "B3",
      "B4",
      "B5",
      "B6"
    ]
  },
  {
    "id": "B1",
    "icon": {
      "fileName": "psa_resourcerequests",
      "namespace": "pse"
    },
    "name": "Staff Opportunity with Pre-Sales Services Member",
    "description": "Before creating a statement of work, this flow articulates the best practice for staffing the resource who will conduct scoping against the opportunity.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#topics/ResourceRequests/AboutResourceRequests.htm",
    "stepType": "PROCESS",
    "steps": [
      "E1",
      "E2",
      "E3",
      "E4"
    ]
  },
  {
    "id": "B2",
    "icon": {
      "fileName": "psa_createfrom",
      "namespace": "pse"
    },
    "name": "Scope Opportunity for Patterned Engagement",
    "description": "Following requirements gathering, this flow defines the actions needed to create a SOW and carry out the handover from Sales to Services. Detailed is the use of project templates for patterned engagements. Reviewing your estimates of project costs and revenue is built into this flow.",
    "stepType": "PROCESS",
    "steps": [
      "E5",
      "E6",
      "E7",
      "E8",
      "E9",
      "E10",
      "E11",
      "E12",
      "E13",
      "E14",
      "E15"
    ]
  },
  {
    "id": "B3",
    "icon": {
      "fileName": "psa_resourcerequests",
      "namespace": "pse"
    },
    "name": "Scope Opportunity for Unique Engagement",
    "description": "Following requirements gathering, this flow drills into the actions needed to create a SOW and carry out the handover from your sales team to your services team. Detailed is the creation of PSA projects that require a unique engagement that do not follow a typical patterned engagement approach. Reviewing your estimates of project costs and revenue is built into this flow.",
    "stepType": "PROCESS",
    "steps": [
      "E5",
      "E6",
      "E16",
      "E8",
      "E9",
      "E10",
      "E11",
      "E12",
      "E13",
      "E14",
      "E15"
    ]
  },
  {
    "id": "B4",
    "icon": {
      "fileName": "psa_resourcerequests",
      "namespace": "pse"
    },
    "name": "Contract Opportunity",
    "description": "This flow describes moving your opportunities to \"Closed Won\" along with submitting resource requests for approval. Ensuring budgets are accurate and match your SOW is also detailed.",
    "stepType": "PROCESS",
    "steps": [
      "E17",
      "E18",
      "E19",
      "E20",
      "E21",
      "E22"
    ]
  },
  {
    "id": "B5",
    "icon": {
      "fileName": "psa_staffing",
      "namespace": "pse"
    },
    "name": "Staff Opportunity Project",
    "description": "Finalize your project preparation prior to execution. This flow details assigning the correct resources to your project, involving your project manager and ensuring a seamless handover from your sales to your project delivery team.",
    "stepType": "PROCESS",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#cshid=1070",
    "steps": [
      "E23",
      "E2",
      "E24",
      "E25",
      "E26",
      "E27"
    ]
  },
  {
    "id": "B6",
    "icon": {
      "name": "standard:opportunity"
    },
    "name": "Opportunity Closed Lost",
    "description": "This flow triggers activities and a review of \"Closed Lost\" reasons will be conducted.",
    "stepType": "PROCESS"
  },
  {
    "id": "E1",
    "name": "Create Resource Request from Opportunity",
    "description": "Using resource requests to begin the process of identifying the roles required for the opportunity.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#cshid=1030",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "Opportunity",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E2",
    "name": "Find Potential Resource in Resource Planner",
    "description": "Identify the resource you need in Resource Planner to effectively scope the opportunity.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#cshid=1040",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__navItemPage",
      "attributes": {
          "apiName": "pse__Resource_Planner"
      }
    }
  },
  {
    "id": "E3",
    "name": "Hold Resource against Resource Requests on Opportunity",
    "description": "When the resource conducting the scoping is identified, hold them against the opportunity in preparation for creating the SOW.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#topics/Resources/HoldingResources.htm",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "Opportunity",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E4",
    "name": "Notify Resource of Scoping Request Assigned",
    "description": "Notify the identified resource of the scoping request.",
    "stepType": "WORKFLOW"
  },
  {
    "id": "E5",
    "name": "Knowledge Transfer and Scoping Call Complete",
    "description": "Ensure the handover from the sales team to the resource who will conduct the scoping and produce the SOW.",
    "stepType": "EXTERNAL"
  },
  {
    "id": "E6",
    "name": "Create Initial SOW",
    "description": "Create the initial SOW prior to moving into project creation.",
    "stepType": "EXTERNAL"
  },
  {
    "id": "E7",
    "name": "Create Project from Template",
    "description": "You can quickly create projects from your templates if you have repeatable projects.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#cshid=1160",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "Opportunity",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E8",
    "name": "Create Resource Requests from Project",
    "description": "Create the resource requests for all the roles needed to successfully deliver the project.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#cshid=1130",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "pse__Proj__c",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E9",
    "name": "Hold Resource Requests with Generic Resources",
    "description": "Hold your resource requests against a set of predefined generic roles.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#topics/Resources/HoldingResources.htm",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "pse__Proj__c",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E10",
    "name": "Create Billable Milestones for Fixed Fee Components",
    "description": "Create billable milestones for any fixed fee projects.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#cshid=1130",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "pse__Proj__c",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E11",
    "name": "Review Cost and Revenue Estimates on Project",
    "description": "Carry out a check to ensure your project costs and revenue are within the tolerances defined by your business rules.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#topics/Projects/ViewingProjectCostandRevenueSummary.htm",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "pse__Proj__c",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E12",
    "name": "Update SOW",
    "description": "Update the initial SOW to reflect additional information.",
    "stepType": "EXTERNAL"
  },
  {
    "id": "E13",
    "name": "Attach SOW File to Opportunity",
    "description": "Upload the updated SOW as a file on the opportunity.",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "Opportunity",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E14",
    "name": "Update Opportunity Amount and Status",
    "description": "Update the opportunity amount to reflect the updated SOW amount as needed, and progress the status of the opportunity.",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "Opportunity",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E15",
    "name": "Scoping Resource Log Time Against Pre-Sales Global Project",
    "description": "The resource who conducted the scoping logs their time against the pre-sales global project.",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__navItemPage",
      "attributes": {
          "apiName": "pse__Log_a_Timecard_New_UI"
      }
    }
  },
  {
    "id": "E16",
    "name": "Create Project",
    "description": "You can create an individual project that has unique requirements. This allows you to tailor the project to meet the needs of the opportunity.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#cshid=1160",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "Opportunity",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E17",
    "name": "Customer Accepts SOW",
    "description": "Send the customer SOW to review and accept.",
    "stepType": "EXTERNAL"
  },
  {
    "id": "E18",
    "name": "Notify Project Owner",
    "description": "Notify the identified project owner of the opportunity.",
    "stepType": "EXTERNAL"
  },
  {
    "id": "E19",
    "name": "Submit Project Resource Request for Assignment",
    "description": "Notify your resource manager that there are resource requests to be filled.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#topics/Resources/AssigningResources.htm",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "pse__Proj__c",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E20",
    "name": "SOW Finalized & Signed",
    "description": "Customer returns signed SOW.",
    "stepType": "EXTERNAL"
  },
  {
    "id": "E21",
    "name": "Set Opportunity to \"Closed Won\"",
    "description": "Update the opportunity to indicate the SOW has been signed and update the status to \"Closed Won\".",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "Opportunity",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E22",
    "name": "Update Project Budget to Reflect SOW Amount",
    "description": "If changes have been made to the SOW ensure they are reflected on the project budget.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#cshid=1081",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "Opportunity",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E23",
    "name": "Review existing Resource Requests",
    "description": "Resource requests that exist are verified and refined.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#cshid=1177",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "pse__Resource_Request__c",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E24",
    "name": "Swap Generic Resources with named resource in Resource Planner",
    "description": "Swap the generic resource roles identified with named resources.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#topics/Planners/SwappingAssignmentsHeldRRs.htm",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__navItemPage",
      "attributes": {
          "apiName": "pse__Resource_Planner"
      }
    }
  },
  {
    "id": "E25",
    "name": "Notify Resources And Project Owner",
    "description": "Notify the resources and project owner.",
    "stepType": "WORKFLOW"
  },
  {
    "id": "E26",
    "name": "Update Project Manager name on Project",
    "description": "As a Project Manager is assigned add their detail to the Project to reflect this assignment.",
    "helpUrl": "http://help.financialforce.com/psa/2018.2/Default.htm#cshid=1153",
    "stepType": "URL",
    "pageRef": {
      "type": "standard__objectPage",
      "attributes": {
          "objectApiName": "pse__Proj__c",
          "actionName": "list"
      },
      "state": {
        "filterName": "Recent"
      }
    }
  },
  {
    "id": "E27",
    "name": "Knowledge Transfer between Sales Team and Project Manager",
    "description": "Conduct a full knowledge transfer between the scoping resource and the Project Manager to ensure seamless project kick off.",
    "stepType": "EXTERNAL"
  }
]
