class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end



end

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss = nil, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total_salary = 0
    @employees.each do |employee|
      if employee.is_a? Manager
        total_salary += employee.total_salary_employees + employee.salary
      else
        total_salary += employee.salary
      end
    end

    total_salary * multiplier
  end

  def total_salary_employees
    total_salary = 0
    employees.each do |employee|
      total_salary += employee.salary
    end
    total_salary
  end

end

if __FILE__ == $PROGRAM_NAME
  david = Employee.new("David", "TA", 10_000, "Darren")
  shawna = Employee.new("Shawna", "TA", 12_000, "Darren")
  darren = Manager.new("Darren", "TA Manager", 78_000, "Ned", [david, shawna])
  ned = Manager.new("Ned", "TA Manager", 78_000, nil, [darren])

  puts ned.bonus(5)
  puts darren.bonus(4)
  puts david.bonus(3)
end
