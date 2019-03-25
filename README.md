# Get-CertTransparencyInfo
All certificate information you need - a cmdlet to request / search all certificates info available for all published certificates - based on CTL info available from crt.sh

(c) 2018 lucas-cueff.com Distributed under Artistic Licence 2.0 (https://opensource.org/licenses/artistic-license-2.0).

## version 0.4 info
fix JSON output issue with new crt.sh version

## install use-onyphe from PowerShell Gallery repository
You can easily install it from powershell gallery repository
https://www.powershellgallery.com/packages/Get-CertTransparencyInfo/
using a simple powershell command and an internet access :-) 
```
	Install-Module -Name Get-CertTransparencyInfo
```
## import module from PowerShell 
```	
	.EXAMPLE
	C:\PS> import-module Get-CertTransparencyInfo.psm1
  
```
## module content
### Get-CertTransparencyInfo function
 ```
		.SYNOPSIS 
		Get CTL info for domains,fqdn using CRT.sh web site
	
		.DESCRIPTION
		Get CTL info for domains,fqdn using CRT.sh web site
	
		.PARAMETER SearchDomain
		Mandatory parameter
		-SearchDomain string
		Provide domain, fqdn to search with crt.sh website

		.PARAMETER AdvSearch
		-advsearch string {'Subject-email','Subject-CommonName','Subject-OrgaName','Subject-OrgaUnitName','San-DnsName','San-IP','San-RFC822Name','Cert-SubjectKeyIdentifier'}
		use advanced search function to target specific data

		.PARAMETER GetCertificate
		-GetCertificate switch
		download all certificates found and add the results in the objects return (property Cli_certificate)

		.PARAMETER IncludeExpired
		-IncludeExpired switch
		include all expired certificates in result
	
		.OUTPUTS
		TypeName : Selected.System.Management.Automation.PSCustomObject
	
		Name                       MemberType   Definition
		----                       ----------   ----------
		Equals                     Method       bool Equals(System.Object obj)
		GetHashCode                Method       int GetHashCode()
		GetType                    Method       type GetType()
		ToString                   Method       string ToString()
		Cli_adv_search             NoteProperty string Cli_adv_search=San-DnsName
		Cli_certificate            NoteProperty System.Security.Cryptography.X509Certificates.X509Certificate2 Cli_certificate=[Subject]...
		Cli_online_certificate_url NoteProperty string Cli_online_certificate_url=https://crt.sh/?d=172086619
		Cli_online_obj_url         NoteProperty string Cli_online_obj_url=https://crt.sh/?id=172086619
		Cli_search_date            NoteProperty datetime Cli_search_date=12/01/2018 16:00:41
		Cli_search_request         NoteProperty string Cli_search_request=www.yahoo.com
		issuer_ca_id               NoteProperty int issuer_ca_id=1397
		issuer_name                NoteProperty string issuer_name=C=US, O=DigiCert Inc, OU=www.digicert.com, CN=DigiCert SHA2 High Assurance Server CA
		min_cert_id                NoteProperty int min_cert_id=172086619
		min_entry_timestamp        NoteProperty System.DateTime min_entry_timestamp=13/07/2017 18:44:02
		name_value                 NoteProperty string name_value=www.yahoo.com
		not_before                 NoteProperty System.DateTime not_before=13/07/2017 00:00:00

		min_cert_id                : 172086619
		issuer_ca_id               : 1397
		not_before                 : 13/07/2017 00:00:00
		name_value                 : www.yahoo.com
		issuer_name                : C=US, O=DigiCert Inc, OU=www.digicert.com, CN=DigiCert SHA2 High Assurance Server CA
		min_entry_timestamp        : 13/07/2017 18:44:02
		Cli_online_obj_url         : https://crt.sh/?id=172086619
		Cli_online_certificate_url : https://crt.sh/?d=172086619
		Cli_adv_search             : San-DnsName
		Cli_search_request         : www.yahoo.com
		Cli_search_date            : 12/01/2018 16:00:41
		Cli_certificate            : [Subject]
									CN=*.att.yahoo.com, O=Yahoo! Inc., L=Sunnyvale, S=CA, C=US

									[Issuer]
									CN=DigiCert SHA2 High Assurance Server CA, OU=www.digicert.com, O=DigiCert Inc, C=US

									[Serial Number]
									0549BC2E73877793DF5F5EC7B7AD9161

									[Not Before]
									13/07/2017 02:00:00

									[Not After]
									13/01/2018 13:00:00

									[Thumbprint]
									978E6DB2761BD4BECFF14CFC21F2A7F95E40B12C

	
		.EXAMPLE
		get certificate info from CTL databases for google.com domain
		C:\PS> Get-CertTransparencyInfo -SearchInfo "google.com"
		
		.EXAMPLE
		get certificate info from CTL databases for google-*.com domain
		C:\PS> Get-CertTransparencyInfo -SearchInfo "google-*.com"

		.EXAMPLE
		get certificate info from CTL databases for certificates containing *.google.com in their SAN
		C:\PS> Get-CertTransparencyInfo -SearchInfo "*google.com" -AdvSearch San-DnsName
		
		.EXAMPLE
		get certificate info from CTL databases for certificates containing *.google.com in their SAN and dump certificate found
		C:\PS> Get-CertTransparencyInfo -SearchInfo "*google.com" -AdvSearch San-DnsName -GetCertificate
		
		.EXAMPLE
		get certificate info from CTL databases for google.com domain including expired
		C:\PS> Get-CertTransparencyInfo -SearchInfo "google.com" -IncludeExpired
    
 ```
