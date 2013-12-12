class DentistVerifier
  def verify(user)
    return false if user.dental_license_number.blank?
    return true if valid_test_number? user.dental_license_number
    return false if user.bill_address && user.bill_address.state.abbr != 'TX'
    
    url = "http://ls.tsbde.texas.gov/inc/xml/xml-dts.php?_searchform=true&lic_nbr=#{user.dental_license_number}&first_nme=#{user.first_name}&last_nme=#{user.last_name}&_search=false&sidx=fullname&rows=1"
    response = open(url).readlines.to_s
    response.include?("Active")
  end
  
  def valid_test_number?(number)
    test_numbers = ['0000', '1111', '2222', '3333', '4444', '5555', '6666', '7777', '8888', '9999']
    Rails.env.production? ? false : test_numbers.include?(number)
  end
end