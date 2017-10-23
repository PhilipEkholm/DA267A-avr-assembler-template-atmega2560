# AVR-Assembler Template for ATmega2560

# Komma igång
Det finns flera sätt att installera alla dependencies du behöver för att få din miljö att fungera. Du ska främst använda dig av terminalen för införskaffning men stegen varierar mellan macOS/Linux, så därför delas dessa upp i olika avsnitt.

Gemensamt för båda är att du måste ha god förkunskap och vara bekväm med att använda terminalen, annars funkar inte detta. Är du inte detta rekommenderar jag en guide till grunderna för terminalen, exempelvis denna.

Medan guiden listad ovan huvudsakligen är skriven för macOS är nästan alla steg identiska mot terminalen i Ubuntu, så linux användare fortfarande inte bekanta med terminalen får chansen nu.

## Assembler

Att sätta upp en toolchain för Assembler visar sig vara svårare än att installera toolchain för gcc (C). Detta beror främst på att assemblern i Atmel Studio är unik till Atmel Studio. Vi kommer därför behöva låna assemblatorn från Atmel Studio. Detta är delvis redan gjort då den finns med i projektmallen du senare kommer få dra ner.

Problemet är att denna är en exe-fil (alltså normalt inte stöds av macOS/Linux system). Du kommer att lösa detta igenom att installera något som kallas Wine, som är kapabelt att köra Windows-program i en UNIX-liknande miljö (macOS, Linux). Detta behöver du enbart för Assembler, detta behövs inte för C.

## Wine för macOS

Wine för macOS installeras bäst genom en pakethanterare vid namn homebrew. Homebrew (vanligtvis förkortat brew) är en vanligt förekommande pakethanterare för macOS som många paket använder sig av. Allt som behövs för att installera det (om du inte redan gjort) är följande kommando i terminalen:


    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Detta kommer installeras m.h.a. Ruby som kommer förinstallerat på macOS.

Säkerställ att Homebrew installerats korrekt igenom följande:


    $ brew —version

När du sedan har Homebrew installerat (vanligen förkortet brew) är det bara följande kommando för att installera wine:


    $ sudo brew install wine

Terminalen kommer fråga efter lösenord, mata då in detta. Även om stjärntecken inte visas för lösenordet så skrivs det ändå in.

## Wine för Debian-distribution

Om du använder Ubuntu eller annan debian-baserad distribution kan du använda dig av APT för att installera en stabil distribution av Wine:


    $ sudo apt-get install wine-stable
----------

Kontrollera naturligtvis att Wine har installerats korrekt igenom:


    $ wine —version


## Installera Avrdude

Titeln är inget skämt, härnäst så ska avrdude installeras.

I det normala fallet när man ska överföra det kompilerade programmet från sin dator till mikrokontrollern behöver man en programmerare för detta. Då dessa kostar lite mer och är pillriga att jobba med använder vi en annan strategi utöver det normala för att överföra program. Vi använder oss av en bootloader.

En bootloader är ett program som sitter förprogrammerad i minnet på vår mikrokontroller vars uppgift är att ladda in programvaran som vi skickar över. För att få över programvaran använder vi seriell-kommunikation (via USB) för att skicka över programmet. Bootloadern kommunicerar med just avrdude så vi måste ha det programmet för att hantera överföringen.


## avrdude för macOS

För att installera avrdude använder vi oss av Homebrew som tidigare:

    $ brew install avrdude --with-usb

“—with-usb” argumentet är väldigt viktigt.

## avrdude för debian-distribution

För Ubuntu/debian distribution kan APT likt tidigare användas:


    $ sudo apt-get install avrdude

—with-usb argumentet behövs ej till skillnad från installation via brew.

----------

Kontrollera sedan att avrdude har installerats korrekt:

    $ avrdude --version






