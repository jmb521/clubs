module Admin::DemographicsHelper


  def current_date
    DateTime.now.to_date
  end

  def separate_ages
    ages = []

    Child.all.each do |c|
      ages << calculate_age(c.birthday)
    end
    
    @age0to2 = ages.count{|age| age.between?(0, 2)}
    @age3to5 = ages.count{|age| age.between?(3,5)}
    @age6to12 = ages.count{|age| age.between?(6, 12)}
    @age13to17 = ages.count{|age| age.between?(13, 17)}
    @age18plus = ages.count{|age| age >= 18}

  end

  def calculate_age(birthday)
    date = birthday.to_date - current_date
    updated_date = date.to_f/365
    if updated_date < 0
      updated_date = updated_date * -1
    end
    updated_date.round

  end

  def age0to2
    @age0to2
  end

  def age3to5
    @age3to5
  end

  def age6to12
    @age6to12
  end

  def age13to17
    @age13to17
  end

  def age18plus
    @age18plus
  end
end
