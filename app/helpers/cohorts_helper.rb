module CohortsHelper

  def all_cohorts
    Cohort.all
  end

  def cohort_students cohort
    cohort.users.where(:role => 0)
  end

end
