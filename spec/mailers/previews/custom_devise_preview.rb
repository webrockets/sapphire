# Preview all emails at http://localhost:3000/rails/mailers/custom_devise
class CustomDevisePreview < ActionMailer::Preview
  def confirmation_instructions
    CustomDeviseMailer.confirmation_instructions(User.first, 'faketoken', {})
  end

  def reset_password_instructions
    CustomDeviseMailer.reset_password_instructions(User.first, 'faketoken', {})
  end

  def unlock_instructions
    CustomDeviseMailer.unlock_instructions(User.first, 'faketoken', {})
  end

  def email_changed
    CustomDeviseMailer.email_changed(User.first, {})
  end

  def password_change
    CustomDeviseMailer.password_change(User.first, {})
  end
end
