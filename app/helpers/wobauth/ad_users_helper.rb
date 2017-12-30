module Wobauth
  module AdUsersHelper
    def new_from_aduser_link(model, aduser)
      return unless (aduser.present? && model.present?)
      case aduser_class(model, aduser)
      when "table-danger"
        if can? :create, model
	  link_to icon_new, new_polymorphic_path([wobauth, model], aduser_attributes(aduser)),
		class: 'btn btn-danger',
		data: {
		  confirm: "Der Eintrag enthält keine E-Mail-Adresse. Wenn es einen ähnlichen Eintrag mit gepflegter E-Mail-Adresse gibt, ist dies hier womöglich der falsche Eintrag. Wollen Sie dennoch weitermachen? Sie können die Daten im folgenden Formular noch korrigieren."
		}
        end
      when "table-primary"
        if can? :create, model
	  link_to icon_new, new_polymorphic_path([wobauth, model], aduser_attributes(aduser)),
		class: 'btn btn-primary'
        end
      when "table-success"
	show_link([wobauth, model.where(email: aduser.mail).first])
      end
    end

    def aduser_class(model, aduser)
      return unless (aduser.present? && model.present?)
      if aduser.mail.blank?
	"table-danger"
      elsif model.exists?(email: aduser.mail)
	"table-success"
      else
	"table-primary"
      end
    end

  private

    def aduser_attributes(aduser)
      {
	username: aduser.username,
	sn: aduser.sn,
	givenname: aduser.givenname,
	displayname: aduser.displayname,
	cn: aduser.cn,
	dn: aduser.dn,
	email: aduser.mail,
	title: aduser.title,
	telephone: aduser.telephonenumber,
	telefax: aduser.facsimiletelephonenumber,
	mobile: aduser.mobile,
	description: aduser.description,
	department: aduser.department,
	company: aduser.company,
	plz: aduser.postalcode,
	ort: aduser.l,
	streetaddress: aduser.streetaddress,
      }
    end

  end
end
