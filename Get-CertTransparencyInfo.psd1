#
# Manifeste de module pour le module ��PSGet_Get-CertTransparancyInfo��
#
# G�n�r� par�: LCU
#
# G�n�r� le�: 12/01/2018
#

@{

# Module de script ou fichier de module binaire associ� � ce manifeste
RootModule = 'Get-CertTransparencyInfo.psm1'

# Num�ro de version de ce module.
ModuleVersion = '0.4.0'

# �ditions PS prises en charge
# CompatiblePSEditions = @()

# ID utilis� pour identifier de mani�re unique ce module
GUID = 'a34304f5-7396-4756-a47e-b6427a3d3f39'

# Auteur de ce module
Author = 'LCU'

# Soci�t� ou fournisseur de ce module
CompanyName = 'lucas-cueff.com'

# D�claration de copyright pour ce module
Copyright = '(c) 2017 lucas-cueff.com Distributed under Artistic Licence 2.0 (https://opensource.org/licenses/artistic-license-2.0).'

# Description de la fonctionnalit� fournie par ce module
Description = 'All certificate information you need - a cmdlet to request / search all certificates info available for all published certificates - based on CTL info available from crt.sh'

# Version minimale du moteur Windows PowerShell requise par ce module
PowerShellVersion = '4.0'

# Nom de l'h�te Windows PowerShell requis par ce module
# PowerShellHostName = ''

# Version minimale de l'h�te Windows PowerShell requise par ce module
# PowerShellHostVersion = ''

# Version minimale du Microsoft .NET Framework requise par ce module. Cette configuration requise est valide uniquement pour PowerShell Desktop Edition.
# DotNetFrameworkVersion = ''

# Version minimale de l�environnement CLR (Common Language Runtime) requise par ce module. Cette configuration requise est valide uniquement pour PowerShell Desktop Edition.
# CLRVersion = ''

# Architecture de processeur (None, X86, Amd64) requise par ce module
# ProcessorArchitecture = ''

# Modules qui doivent �tre import�s dans l'environnement global pr�alablement � l'importation de ce module
# RequiredModules = @()

# Assemblys qui doivent �tre charg�s pr�alablement � l'importation de ce module
# RequiredAssemblies = @()

# Fichiers de script (.ps1) ex�cut�s dans l�environnement de l�appelant pr�alablement � l�importation de ce module
# ScriptsToProcess = @()

# Fichiers de types (.ps1xml) � charger lors de l'importation de ce module
# TypesToProcess = @()

# Fichiers de format (.ps1xml) � charger lors de l'importation de ce module
# FormatsToProcess = @()

# Modules � importer en tant que modules imbriqu�s du module sp�cifi� dans RootModule/ModuleToProcess
# NestedModules = @()

# Fonctions � exporter � partir de ce module. Pour de meilleures performances, n�utilisez pas de caract�res g�n�riques et ne supprimez pas l�entr�e. Utilisez un tableau vide si vous n�avez aucune fonction � exporter.
FunctionsToExport = 'Get-CertTransparencyInfo'


# Applets de commande � exporter � partir de ce module. Pour de meilleures performances, n�utilisez pas de caract�res g�n�riques et ne supprimez pas l�entr�e. Utilisez un tableau vide si vous n�avez aucune applet de commande � exporter.
CmdletsToExport = @()

# Variables � exporter � partir de ce module
# VariablesToExport = @()

# Alias � exporter � partir de ce module. Pour de meilleures performances, n�utilisez pas de caract�res g�n�riques et ne supprimez pas l�entr�e. Utilisez un tableau vide si vous n�avez aucun alias � exporter.
AliasesToExport = @()

# Ressources DSC � exporter depuis ce module
# DscResourcesToExport = @()

# Liste de tous les modules empaquet�s avec ce module
# ModuleList = @()

# Liste de tous les fichiers empaquet�s avec ce module
FileList = 'Get-CertTransparencyInfo.psm1'

# Donn�es priv�es � transmettre au module sp�cifi� dans RootModule/ModuleToProcess. Cela peut �galement inclure une table de hachage PSData avec des m�tadonn�es de modules suppl�mentaires utilis�es par PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('crt.sh','CTL','Certificate','SSL','TLS','Transparency','Log')

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/MS-LUF/Get-CertTransparencyInfo'

        # A URL to an icon representing this module.
        IconUri = 'http://www.lucas-cueff.com/files/gallery.png'

        # ReleaseNotes of this module
        ReleaseNotes = 'fix new json parameter with new crt.sh website'

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable
    
 } # End of PrivateData hashtable

# URI HelpInfo de ce module
# HelpInfoURI = ''

# Le pr�fixe par d�faut des commandes a �t� export� � partir de ce module. Remplacez le pr�fixe par d�faut � l�aide d�Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

