module Concerns::Findable
  def find_by_name(name)
    self.all.detect {|inst| inst.name == name}
  end

  def find_or_create_by_name(name)
    inst = self.find_by_name(name)
    inst ? inst : self.create(name)
  end
end
