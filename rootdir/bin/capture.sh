#!/system/bin/sh

function enable_ultracapture()
{
	printf "打开MIC通路++\n"
	tinymix 'UL7_CH1 ADDA_UL_CH1' '1'
	tinymix 'UL7_CH2 ADDA_UL_CH2' '1'
	tinymix 'MISO0_MUX' 'UL1_CH1'
	tinymix 'MISO1_MUX' 'UL1_CH2'
	tinymix 'ADC_L_Mux' 'Left Preamplifier'
	tinymix 'PGA_L_Mux' 'AIN0'
	tinymix 'ADC_R_Mux' 'Right Preamplifier'
	tinymix 'PGA_R_Mux' 'AIN2'
	tinymix 'DMIC0_MUX' 'DMIC_DATA0'
	tinymix 'DMIC1_MUX' 'DMIC_DATA1_L_1'

	tinycap /sdcard/us_mic.wav -D 0 -d 17 -r $1 -b $2 -c $3 -T $4
	printf "录音结束\n"
}

function disable_ultracapture
{
	printf "关闭MIC通路++\n"
	tinymix 'ADC_L_Mux' 'Idle'
	tinymix 'ADC_R_Mux' 'Idle'
	tinymix 'PGA_L_Mux' 'None'
	tinymix 'PGA_R_Mux' 'None'
	tinymix 'UL_SRC_MUX' 'AMIC'
	tinymix 'UL2_SRC_MUX' 'AMIC'
	tinymix 'UL7_CH1 ADDA_UL_CH1' '0'
	tinymix 'UL7_CH2 ADDA_UL_CH2' '0'

}

if test -z $1 
then
   printf "输入参数格式：capture.sh 96000(SampleRate) 16(SampleBit) 2(SampleChannel) 6(Time:s)\n"
else

   enable_ultracapture $1 $2 $3 $4
   disable_ultracapture

fi
