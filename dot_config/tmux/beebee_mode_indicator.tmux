set -g @beebee_indicator_normal_text "NORM"
set -g @beebee_indicator_normal_text_color "#{@thm_surface_1}"
set -g @beebee_indicator_normal_bg_color "#{@thm_green}"

set -g @beebee_indicator_prefix_text "PREF"
set -g @beebee_indicator_prefix_text_color "#{@thm_surface_1}"
set -g @beebee_indicator_prefix_bg_color "#{@thm_red}"

set -g @beebee_indicator_visual_text "VISL"
set -g @beebee_indicator_visual_text_color "#{@thm_surface_1}"
set -g @beebee_indicator_visual_bg_color "#{@thm_blue}"


set -g @beebee_indicator_suspend_text "SUSP"
set -g @beebee_indicator_suspend_text_color "#{@thm_surface_1}"
set -g @beebee_indicator_suspend_bg_color "#{@thm_peach}"

set -g @beebee_indicator_left_sep ""
set -g @beebee_indicator_right_sep ""

set -g @beebee_indicator_module_text \
"#{?client_prefix,#{E:@beebee_indicator_prefix_text},
#{?@mode_indicator_custom_prompt,#{E:@beebee_indicator_suspend_text},
#{?pane_in_mode,#{E:@beebee_indicator_visual_text},
#{E:@beebee_indicator_normal_text}}}}"

set -g @beebee_indicator_module_text_color \
"#{?client_prefix,#{E:@beebee_indicator_prefix_text_color},\
#{?@mode_indicator_custom_prompt,#{E:@beebee_indicator_suspend_text_color},\
#{?pane_in_mode,#{E:@beebee_indicator_visual_text_color},\
#{E:@beebee_indicator_normal_text_color}}}}"

set -g @beebee_indicator_module_color \
"#{?client_prefix,#{E:@beebee_indicator_prefix_bg_color},\
#{?@mode_indicator_custom_prompt,#{E:@beebee_indicator_suspend_bg_color},\
#{?pane_in_mode,#{E:@beebee_indicator_visual_bg_color},\
#{E:@beebee_indicator_normal_bg_color}}}}"

set -g @beebee_mode_indicator "#[fg=#{E:@beebee_indicator_module_color}]#{E:@beebee_indicator_left_sep}"
set -ag @beebee_mode_indicator "#[fg=#{E:@beebee_indicator_module_text_color},bg=#{E:@beebee_indicator_module_color}]#{E:@beebee_indicator_module_text}"
set -ag @beebee_mode_indicator "#[fg=#{E:@beebee_indicator_module_color},bg=#{E:@thm_bg}]#{E:@beebee_indicator_right_sep}"
