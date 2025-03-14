#!/system/bin/sh
function enable_playback
{
	printf "打开听筒通路++\n"
	tinymix 'FSM_Scene' '15'
	tinymix 'FSM_Volume' '244'
	tinymix 'aw_dev_0_prof' 'voice'
	tinymix 'aw_dev_0_switch' 'Enable'
	tinymix 'aw_dev_1_prof' 'voice'
	tinymix 'aw_dev_1_switch' 'Disable'
	tinymix 'SpkrRight Sipa Mute' '1'
	tinymix 'SpkrLeft Sipa Mute' '0'
	tinymix 'SpkrLeft Sipa Audio Scene' 'Receiver'
	tinymix 'I2SOUT4_CH1 DL7_CH1' '1'
	tinymix 'I2SOUT4_CH2 DL7_CH2' '1'
	tinymix 'I2SOUT4_HD_Mux' 'Low_Jitter'
}
function disable_playback
{
	printf "关闭播放通路++\n"
	tinymix 'I2SOUT4_CH1 DL7_CH1' '0'
	tinymix 'I2SOUT4_CH2 DL7_CH2' '0'
	tinymix 'I2SOUT4_HD_Mux' 'Normal'
	tinymix 'aw_dev_0_prof' 'music'
	tinymix 'aw_dev_0_switch' 'Enable'
	tinymix 'aw_dev_1_prof' 'music'
	tinymix 'aw_dev_1_switch' 'Enable'
	tinymix 'FSM_Scene' '0'
	tinymix 'FSM_Volume' '242'
	tinymix 'SpkrLeft Sipa Power' 'Off'
	tinymix 'SpkrRight Sipa Power' 'Off'
	tinymix 'SpkrRight Sipa Mute' '0'
	tinymix 'SpkrLeft Sipa Audio Scene' 'Playback'
}

enable_playback
printf "start playing\n"
tinyplay /vendor/etc/mmigroup/ultrasound.wav -D 0 -d 7
disable_playback
