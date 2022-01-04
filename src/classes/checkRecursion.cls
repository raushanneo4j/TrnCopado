/*
* @author: Peter Noges
* @purpose: prevents recursion, please implement a static boolean for each feature you are wrapping in recursion checks to avoid unintended feature recursion
*/
/*
  example:
  If(!TrggrUtility.RunOnce) 
  {
    // do... call method
    TrggrUtility.RunOnce = true;
  
  }else{
  
    // exit trigger or code section
  
  }
*/
public Class checkRecursion{
  public static boolean already_run_a7z3s0000004sgiaam_once_in_opportunitylineitem_contexts_to_track_ARR_field_history_as_a_workaround_for_sfdc_ga_limitation_ideaview_0873a000000e8ccqas = FALSE; //the checkRecursion class initializes stuff to false, which is the signal in other logic to run a feature once.
  public static boolean already_run_a7z3s0000004sgiaam_once_in_opportunity_before_update_to_restrict_who_can_edit_records_in_stages_salesopsreview_and_financereview = FALSE; //the checkRecursion class initializes stuff to false, which is the signal in other logic to run a feature once.
}