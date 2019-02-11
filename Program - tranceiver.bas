$regfile = "m8535.dat"
$crystal = 8000000
$baud = 9600

Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7
Config Lcdpin = Pin , E = Portc.2 , Rs = Portc.0 ,
Config Lcd = 16 * 2
Config Kbd = Porta
Cursor On Blink
Dim Kodechar As Integer
Dim Poschar As Integer
Dim Keypad As Integer
Dim Char As String * 1
Dim Datachar As String * 16
Dim Pesan As String * 16
Dim N As Integer
Dim I(16) As String * 1
Dim K1 As String * 1
Dim K2 As String * 1
Dim K3 As String * 1
Dim K4 As String * 1
Dim K5 As String * 1
Dim K6 As String * 1
Dim K7 As String * 1
Dim K8 As String * 1
Dim K9 As String * 1
Dim K10 As String * 1
Dim K11 As String * 1
Dim K12 As String * 1
Dim K13 As String * 1
Dim K14 As String * 1
Dim K15 As String * 1
Dim K16 As String * 1

Cls
Kodechar = 0
Poschar = 1

Config Serialin = Buffered , Size = 16
Enable Interrupts
Config Portd.6 = Output
Config Portd.5 = Output
Portd.6 = 1
Portd.5 = 1
Dim Tampung As Byte

Do
   Tampung = Inkey()
Loop Until Ischarwaiting() = 0
Do
   If Ischarwaiting() = 1 Then
      Portd.6 = 0
      Portd.5 = 0
      Wait 1
      Portd.6 = 1
      Do
         For N = 1 To 16
            Tampung = Inkey()
            I(n) = Chr(tampung)
            Waitms 20
         Next N
         Pesan = I(1) + I(2) + I(3) + I(4) + I(5) + I(6) + I(7) + I(8) + I(9) + I(10) + I(11) + I(12) + I(13) + I(14) + I(15) + I(16)
      Loop Until Ischarwaiting() = 0
   Else
   End If

   Keypad = Getkbd()
   Locate 1 , Poschar : Lcd Char

   Select Case Kodechar
      Case -1 : Kodechar = 39
      Case 0 : Char = " "
      Case 1 : Char = ","
      Case 2 : Char = "?"
      Case 3 : Char = "!"
      Case 4 : Char = "A"
      Case 5 : Char = "B"
      Case 6 : Char = "C"
      Case 7 : Char = "D"
      Case 8 : Char = "E"
      Case 9 : Char = "F"
      Case 10 : Char = "G"
      Case 11 : Char = "H"
      Case 12 : Char = "I"
      Case 13 : Char = "J"
      Case 14 : Char = "K"
      Case 15 : Char = "L"
      Case 16 : Char = "M"
      Case 17 : Char = "N"
      Case 18 : Char = "O"
      Case 19 : Char = "P"
      Case 20 : Char = "Q"
      Case 21 : Char = "R"
      Case 22 : Char = "S"
      Case 23 : Char = "T"
      Case 24 : Char = "U"
      Case 25 : Char = "V"
      Case 26 : Char = "W"
      Case 27 : Char = "X"
      Case 28 : Char = "Y"
      Case 29 : Char = "Z"
      Case 30 : Char = "0"
      Case 31 : Char = "1"
      Case 32 : Char = "2"
      Case 33 : Char = "3"
      Case 34 : Char = "4"
      Case 35 : Char = "5"
      Case 36 : Char = "6"
      Case 37 : Char = "7"
      Case 38 : Char = "8"
      Case 39 : Char = "9"
      Case 40 : Kodechar = 0
   End Select
   Select Case Keypad
      Case 14 : Decr Kodechar
      Case 6 : Incr Kodechar
      Case 11 : Decr Poschar
      Case 9 : Incr Poschar
      Case 3 : Cls
            Poschar = 1
            Kodechar = 0
      Case 10 :

            Datachar = K1 + K2 + K3 + K4 + K5 + K6 + K7 + K8 + K9 + K10 + K11 + K12 + K13 + K14 + K15 + K16 + "                "
            Print Datachar
            Cls
            Locate 1 , 1
            Lcd "Sending."
            Waitms 700
            Locate 1 , 1
            Lcd "Sending.."
            Waitms 700
            Locate 1 , 1
            Lcd "Sending..."
            Waitms 700
            Cls
            Poschar = 1
            Kodechar = 0
      Case 1 :
            Datachar = K1 + K2 + K3 + K4 + K5 + K6 + K7 + K8 + K9 + K10 + K11 + K12 + K13 + K14 + K15 + K16
            Cls
            Locate 1 , 1
            Lcd Pesan
            Waitms 4000
            Portd.5 = 1
            Cls
            Locate 1 , 1
            Lcd Datachar
      Case 16
   End Select

   Select Case Poschar
      Case 1 : K1 = Char
      Case 2 : K2 = Char
      Case 3 : K3 = Char
      Case 4 : K4 = Char
      Case 5 : K5 = Char
      Case 6 : K6 = Char
      Case 7 : K7 = Char
      Case 8 : K8 = Char
      Case 9 : K9 = Char
      Case 10 : K10 = Char
      Case 11 : K11 = Char
      Case 12 : K12 = Char
      Case 13 : K13 = Char
      Case 14 : K14 = Char
      Case 15 : K15 = Char
      Case 16 : K16 = Char
   End Select

   If Poschar < 1 Then
      Poschar = 16
   Else
   End If

   If Poschar > 16 Then
      Poschar = 1
   Else
   End If

   Waitms 175
Loop