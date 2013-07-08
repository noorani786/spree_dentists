class DentistVerifier
  def verify(user)
    return true unless user.is_dentist
    
    url = "http://ls.tsbde.texas.gov/inc/xml/xml-dts.php?_searchform=true&lic_nbr=#{user.dental_license_number}&first_nme=#{user.first_name}&last_nme=#{user.last_name}&_search=false&sidx=fullname&rows=1"
    response = open(url).readlines.to_s
    response.include?("Active")
  end
end