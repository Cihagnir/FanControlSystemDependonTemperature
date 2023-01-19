int ADC_Read_One = 0 ;
int ADC_Read_Two = 0 ;

float Temp_Value_One = 0 ;
float Temp_Value_Two = 0 ;

float Prvs_Temp_One = 0 ;
float Prvs_Temp_Two = 0 ;

char Str_one[14];
char Str_two[14];

sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;

void main() {
ADC_Init();
Lcd_Init();

PORTD = 0 ;
TRISD = 0 ;

while(1){
  ADC_Read_One = ADC_Get_Sample(0);
  ADC_Read_Two = ADC_Get_Sample(1);

  Temp_Value_One = (float) ADC_Read_One*5000/10230;
  Temp_Value_Two = (float) ADC_Read_Two*5000/10230;

  if((Prvs_Temp_One != Temp_Value_One)|| (Prvs_Temp_Two != Temp_Value_Two)) {
    FloatToStr(Temp_Value_One,Str_one);
    FloatToStr(Temp_Value_Two,Str_two);

    Prvs_Temp_One = Temp_Value_One ;
    Prvs_Temp_Two = Temp_Value_Two ;

    Str_one[5] = 0;
    Str_two[5] = 0;

    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Out(1,1, "Temp 1 :");
    Lcd_Out(1,10, Str_one);
    Lcd_Out(2,1, "Temp 2 :");
    Lcd_Out(2,10, Str_two);
    
        if(Temp_Value_One > (Temp_Value_Two)){
            Lcd_Cmd(_LCD_CLEAR);
            Lcd_Out(1,1, "F*ck Hot");
            PORTD.F0 = 1 ;
            }
        else{
        PORTD.F0 = 0 ;
        }


    }
  }
}