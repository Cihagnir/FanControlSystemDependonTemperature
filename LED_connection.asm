
_main:

;LED_connection.c,27 :: 		void main() {
;LED_connection.c,28 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;LED_connection.c,29 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;LED_connection.c,31 :: 		PORTD = 0 ;
	CLRF        PORTD+0 
;LED_connection.c,32 :: 		TRISD = 0 ;
	CLRF        TRISD+0 
;LED_connection.c,34 :: 		while(1){
L_main0:
;LED_connection.c,35 :: 		ADC_Read_One = ADC_Get_Sample(0);
	CLRF        FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _ADC_Read_One+0 
	MOVF        R1, 0 
	MOVWF       _ADC_Read_One+1 
;LED_connection.c,36 :: 		ADC_Read_Two = ADC_Get_Sample(1);
	MOVLW       1
	MOVWF       FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+4 
	MOVF        R1, 0 
	MOVWF       FLOC__main+5 
	MOVF        FLOC__main+4, 0 
	MOVWF       _ADC_Read_Two+0 
	MOVF        FLOC__main+5, 0 
	MOVWF       _ADC_Read_Two+1 
;LED_connection.c,38 :: 		Temp_Value_One = (float) ADC_Read_One*5000/10230;
	MOVF        _ADC_Read_One+0, 0 
	MOVWF       R0 
	MOVF        _ADC_Read_One+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       64
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       139
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       216
	MOVWF       R5 
	MOVLW       31
	MOVWF       R6 
	MOVLW       140
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVF        FLOC__main+0, 0 
	MOVWF       _Temp_Value_One+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       _Temp_Value_One+1 
	MOVF        FLOC__main+2, 0 
	MOVWF       _Temp_Value_One+2 
	MOVF        FLOC__main+3, 0 
	MOVWF       _Temp_Value_One+3 
;LED_connection.c,39 :: 		Temp_Value_Two = (float) ADC_Read_Two*5000/10230;
	MOVF        FLOC__main+4, 0 
	MOVWF       R0 
	MOVF        FLOC__main+5, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       64
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       139
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       216
	MOVWF       R5 
	MOVLW       31
	MOVWF       R6 
	MOVLW       140
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Temp_Value_Two+0 
	MOVF        R1, 0 
	MOVWF       _Temp_Value_Two+1 
	MOVF        R2, 0 
	MOVWF       _Temp_Value_Two+2 
	MOVF        R3, 0 
	MOVWF       _Temp_Value_Two+3 
;LED_connection.c,41 :: 		if((Prvs_Temp_One != Temp_Value_One)|| (Prvs_Temp_Two != Temp_Value_Two)) {
	MOVF        _Prvs_Temp_One+0, 0 
	MOVWF       R0 
	MOVF        _Prvs_Temp_One+1, 0 
	MOVWF       R1 
	MOVF        _Prvs_Temp_One+2, 0 
	MOVWF       R2 
	MOVF        _Prvs_Temp_One+3, 0 
	MOVWF       R3 
	MOVF        FLOC__main+0, 0 
	MOVWF       R4 
	MOVF        FLOC__main+1, 0 
	MOVWF       R5 
	MOVF        FLOC__main+2, 0 
	MOVWF       R6 
	MOVF        FLOC__main+3, 0 
	MOVWF       R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main7
	MOVF        _Prvs_Temp_Two+0, 0 
	MOVWF       R0 
	MOVF        _Prvs_Temp_Two+1, 0 
	MOVWF       R1 
	MOVF        _Prvs_Temp_Two+2, 0 
	MOVWF       R2 
	MOVF        _Prvs_Temp_Two+3, 0 
	MOVWF       R3 
	MOVF        _Temp_Value_Two+0, 0 
	MOVWF       R4 
	MOVF        _Temp_Value_Two+1, 0 
	MOVWF       R5 
	MOVF        _Temp_Value_Two+2, 0 
	MOVWF       R6 
	MOVF        _Temp_Value_Two+3, 0 
	MOVWF       R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main7
	GOTO        L_main4
L__main7:
;LED_connection.c,42 :: 		FloatToStr(Temp_Value_One,Str_one);
	MOVF        _Temp_Value_One+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _Temp_Value_One+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _Temp_Value_One+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _Temp_Value_One+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _Str_one+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_Str_one+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;LED_connection.c,43 :: 		FloatToStr(Temp_Value_Two,Str_two);
	MOVF        _Temp_Value_Two+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _Temp_Value_Two+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _Temp_Value_Two+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _Temp_Value_Two+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _Str_two+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_Str_two+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;LED_connection.c,45 :: 		Prvs_Temp_One = Temp_Value_One ;
	MOVF        _Temp_Value_One+0, 0 
	MOVWF       _Prvs_Temp_One+0 
	MOVF        _Temp_Value_One+1, 0 
	MOVWF       _Prvs_Temp_One+1 
	MOVF        _Temp_Value_One+2, 0 
	MOVWF       _Prvs_Temp_One+2 
	MOVF        _Temp_Value_One+3, 0 
	MOVWF       _Prvs_Temp_One+3 
;LED_connection.c,46 :: 		Prvs_Temp_Two = Temp_Value_Two ;
	MOVF        _Temp_Value_Two+0, 0 
	MOVWF       _Prvs_Temp_Two+0 
	MOVF        _Temp_Value_Two+1, 0 
	MOVWF       _Prvs_Temp_Two+1 
	MOVF        _Temp_Value_Two+2, 0 
	MOVWF       _Prvs_Temp_Two+2 
	MOVF        _Temp_Value_Two+3, 0 
	MOVWF       _Prvs_Temp_Two+3 
;LED_connection.c,48 :: 		Str_one[5] = 0;
	CLRF        _Str_one+5 
;LED_connection.c,49 :: 		Str_two[5] = 0;
	CLRF        _Str_two+5 
;LED_connection.c,51 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LED_connection.c,52 :: 		Lcd_Out(1,1, "Temp 1 :");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_LED_connection+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_LED_connection+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LED_connection.c,53 :: 		Lcd_Out(1,10, Str_one);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _Str_one+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_Str_one+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LED_connection.c,54 :: 		Lcd_Out(2,1, "Temp 2 :");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_LED_connection+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_LED_connection+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LED_connection.c,55 :: 		Lcd_Out(2,10, Str_two);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _Str_two+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_Str_two+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LED_connection.c,57 :: 		if(Temp_Value_One > (Temp_Value_Two)){
	MOVF        _Temp_Value_One+0, 0 
	MOVWF       R4 
	MOVF        _Temp_Value_One+1, 0 
	MOVWF       R5 
	MOVF        _Temp_Value_One+2, 0 
	MOVWF       R6 
	MOVF        _Temp_Value_One+3, 0 
	MOVWF       R7 
	MOVF        _Temp_Value_Two+0, 0 
	MOVWF       R0 
	MOVF        _Temp_Value_Two+1, 0 
	MOVWF       R1 
	MOVF        _Temp_Value_Two+2, 0 
	MOVWF       R2 
	MOVF        _Temp_Value_Two+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
;LED_connection.c,58 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LED_connection.c,59 :: 		Lcd_Out(1,1, "F*ck Hot");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_LED_connection+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_LED_connection+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LED_connection.c,60 :: 		PORTD.F0 = 1 ;
	BSF         PORTD+0, 0 
;LED_connection.c,61 :: 		}
	GOTO        L_main6
L_main5:
;LED_connection.c,63 :: 		PORTD.F0 = 0 ;
	BCF         PORTD+0, 0 
;LED_connection.c,64 :: 		}
L_main6:
;LED_connection.c,67 :: 		}
L_main4:
;LED_connection.c,68 :: 		}
	GOTO        L_main0
;LED_connection.c,69 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
