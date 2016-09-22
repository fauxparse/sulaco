module TeamHelpers
  def team(*args)
    @team = nil if args.any?
    options = args.extract_options!
    @team ||= FactoryGirl.create(:team, *args, options)
  end

  def manager(*args)
    @manager = nil if args.any?
    options = args.extract_options!
    @manager ||= @member = FactoryGirl.create(:manager, *args, options)
  end

  def member(*args)
    @member = nil if args.any?
    options = args.extract_options!
    @member ||= FactoryGirl.create(:member, *args, options)
  end

  def password
    FactoryGirl.attributes_for(:user)[:password]
  end
end
