#
# Created by: lucas.cueff[at]lucas-cueff.com
#
# Released on: 01/2018
#
# v0.4.0: fix json request with new crt.sh website version
#
#'(c) 2018 lucas-cueff.com - Distributed under Artistic Licence 2.0 (https://opensource.org/licenses/artistic-license-2.0).'

Function Get-CertTransparencyInfo {
	<#
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
		C:\PS> Get-CertTransparancyInfo -SearchInfo "google.com"
		
		.EXAMPLE
		get certificate info from CTL databases for google-*.com domain
		C:\PS> Get-CertTransparancyInfo -SearchInfo "google-*.com"

		.EXAMPLE
		get certificate info from CTL databases for certificates containing *.google.com in their SAN
		C:\PS> Get-CertTransparancyInfo -SearchInfo "*google.com" -AdvSearch San-DnsName
		
		.EXAMPLE
		get certificate info from CTL databases for certificates containing *.google.com in their SAN and dump certificate found
		C:\PS> Get-CertTransparancyInfo -SearchInfo "*google.com" -AdvSearch San-DnsName -GetCertificate

		.EXAMPLE
		get certificate info from CTL databases for google.com domain including expired
		C:\PS> Get-CertTransparancyInfo -SearchInfo "google.com" -IncludeExpired


	#>
	[cmdletbinding()]
		param(
			[parameter(ValueFromPipelineByPropertyName=$true,ValueFromPipeline=$true,Mandatory=$true)]
			   [string] $SearchInfo,
			[parameter(Mandatory=$false)] 
			[ValidateSet('Subject-email','Subject-CommonName','Subject-OrgaName','Subject-OrgaUnitName','San-DnsName','San-IP','San-RFC822Name','Cert-SubjectKeyIdentifier')]
			   [String]$AdvSearch,
			[parameter(Mandatory=$false)]
			   [switch]$GetCertificate,
			[parameter(Mandatory=$false)]
			   [switch]$IncludeExpired
		)
		$SearchInfo = $SearchInfo -replace " ", "+"
		$SearchInfo = $SearchInfo -replace "\*", "%"
		$script:currentdate = get-date
		$script:crtsh = "https://crt.sh/"
		if ($IncludeExpired.IsPresent) {
			$ExcludeExpired = $null
		} Else {
			$ExcludeExpired = "&exclude=expired"					
		}
		if ($advsearch){
			switch ($advsearch) {
				'Subject-email' {$url = "$($crtsh)?E=$($SearchInfo)&output=json$ExcludeExpired"}
				'Subject-CommonName' {$url = "$($crtsh)?CN=$($SearchInfo)&output=json$ExcludeExpired"}
				'Subject-OrgaName' {$url = "$($crtsh)?O=$($SearchInfo)&output=json$ExcludeExpired"}
				'Subject-OrgaUnitName' {$url = "$($crtsh)?OU=$($SearchInfo)&output=json$ExcludeExpired"}
				'San-DnsName' {$url = "$($crtsh)?dNSName=$($SearchInfo)&output=json$ExcludeExpired"}
				'San-IP' {$url = "$($crtsh)?iPAddress=$($SearchInfo)&output=json$ExcludeExpired"}
				'San-RFC822Name' {$url = "$($crtsh)?rfc822Name=$($SearchInfo)&output=json$ExcludeExpired"}
				'Cert-SubjectKeyIdentifier' {$url = "$($crtsh)?ski=$($SearchInfo)&output=json$ExcludeExpired"}
				Default {$url = "$($crtsh)?q=$($SearchInfo)&output=json"}
			}
		} else {
			$url = "$($crtsh)?q=$($SearchInfo)&output=json"
		}
		$Script:FinalCTLInfo = @()
		$Script:CTLTemplateObject = New-Object psobject
		$CTLTemplateObject | Add-Member -MemberType NoteProperty -Name "min_cert_id" -Value $null
		$CTLTemplateObject | Add-Member -MemberType NoteProperty -Name "issuer_ca_id" -Value $null
		$CTLTemplateObject | Add-Member -MemberType NoteProperty -Name "not_before" -Value $null
		$CTLTemplateObject | Add-Member -MemberType NoteProperty -Name "name_value" -Value $null
		$CTLTemplateObject | Add-Member -MemberType NoteProperty -Name "issuer_name" -Value $null
		$CTLTemplateObject | Add-Member -MemberType NoteProperty -Name "min_entry_timestamp" -Value $null
		$CTLTemplateObject | Add-Member -MemberType NoteProperty -Name "Cli_online_obj_url"  -Value $null
		$CTLTemplateObject | Add-Member -MemberType NoteProperty -Name "Cli_online_certificate_url"  -Value $null
		$CTLTemplateObject | Add-Member -MemberType NoteProperty -Name "Cli_adv_search"  -Value $false
		$CTLTemplateObject | Add-Member -MemberType NoteProperty -Name "Cli_search_request"  -Value $null
		$CTLTemplateObject | Add-Member -MemberType NoteProperty -Name "Cli_search_date"  -Value $null
		$CTLTemplateObject | Add-Member -MemberType NoteProperty -Name "Cli_certificate"  -Value $null
		try {
			$webdata = invoke-webrequest $url
		} catch {
			if ($_.Exception.Response.StatusCode.Value__ -eq 404) {
				write-warning "No certificate found"
			} Else {
				write-warning "website error or not available"
				write-error "Error Type: $($_.Exception.GetType().FullName)"
				write-error "Error Message: $($_.Exception.Message)"
			}
			return
		}
		try {
			$Filteredwebdata = $webdata.content | convertfrom-json
		} catch {
			write-warning "Error when parsing Json file"
			write-error "Error Type: $($_.Exception.GetType().FullName)"
			write-error "Error Message: $($_.Exception.Message)"
			return
		}
		foreach ($data in $Filteredwebdata) {
			$tmpobj = $Script:CTLTemplateObject | select-object *
			$tmpobj.min_cert_id = $data.min_cert_id
			$tmpobj.issuer_ca_id = $data.issuer_ca_id
			$tmpobj.name_value = $data.name_value
			$tmpobj.issuer_name = $data.issuer_name
			$tmpobj.not_before = get-date $data.not_before
			try {
				$tmpobj.min_entry_timestamp = get-date $data.min_entry_timestamp
			} catch {

			}
			$tmpobj.Cli_online_obj_url = "$($crtsh)?id=$($data.min_cert_id)"
			$tmpobj.Cli_online_certificate_url = "$($crtsh)?d=$($data.min_cert_id)"
			if ($advsearch) {$tmpobj.Cli_adv_search = $advsearch}
			$tmpobj.Cli_search_request = $SearchInfo
			$tmpobj.Cli_search_date = $currentdate
			if ($GetCertificate.IsPresent) {
				$tmpcert = Invoke-WebRequest "$($tmpobj.Cli_online_certificate_url)" -ErrorAction Continue
				if ($tmpcert) {
					$tmpobcert = new-object System.Security.Cryptography.X509Certificates.X509Certificate2
					$tmpobcert.Import($tmpcert.content)
					$tmpobj.Cli_certificate = $tmpobcert
				}
			}
			$Script:FinalCTLInfo += $tmpobj
		}
		If ($FinalCTLInfo) {return $FinalCTLInfo}
	}
	
	Export-ModuleMember -Function Get-CertTransparencyInfo