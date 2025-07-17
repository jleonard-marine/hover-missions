behavior_name=drift_at_depth
# drift_10.ma
# developed by RUCOOL

<start:b_arg>
    b_arg: start_when(enum)             2
    b_arg: end_action(enum)             0       # 2-resume
	
	# Should be ignored if start_when not UTC
	b_arg: when_utc_timestamp(dtime)	-1
	b_arg: when_secs(sec)				180		# in surface beh 0 means UTC just once
	
    b_arg: stop_when_hover_for(sec)     200.0	# terminate hover when depth does not change for
    b_arg: est_time_to_settle(s)        120.0	# estimated time for glider to settle at depth
    b_arg: target_depth(m)              10	# depth to drift at
    b_arg: target_altitude(m)           -1      # altitude to drift at, <=0 disables
    b_arg: alt_time(s)                  -1      # time spacing for altimeter pings
    
    b_arg: target_deadband(m)           3	# +/- around target depth
    b_arg: start_dist_from_target(m)    0    	# Start drift x m away: -1 means use the target_deadband
    b_arg: depth_ctrl(enum)             0       # 0 = Buoyancy pump, 2 = pitch
    b_arg: bpump_delta_value(cc)        35.0	# Increments to adjust x_hover_ballast(cc) for nuetral
    b_arg: bpump_deadz_width(cc)        35.0    # For temporarily adjusting the buoyancy pump
    b_arg: bpump_db_frac_dz(nodim)      0.66    # deadband during the drift_at_depth behavior
    b_arg: bpump_delay(s)               120     # mininum time between adjustments

    # Pitch/steering Parameters
    b_arg: use_pitch(enum)              3       # 3  Servo on Pitch
    b_arg: pitch_value(X)               -.35    # radians or in
    b_arg: wait_for_pitch(bool)         0       # wait to adjust ballast when pitch in deadband
    b_arg: enable_steering(bool)        0
	
	# Thruster
	# b_arg: use_thruster(enum)   		0		# 0  Not in use, 1 % glider V, 2 % max thruster V, 4 Watts
        # b_arg: thruster_value(X)   		0		# based on above

    # Dive to hover zone
    b_arg: d_use_bpump(enum)            2	# 2 absolute
    b_arg: d_bpump_value(X)             -250.0
    b_arg: d_use_pitch(enum)            3       # servo on pitch
    b_arg: d_pitch_value(X)             -0.4 	
    # Climb to hover zone (likely brought to surface by surfacing behavior, not hover)
    b_arg: c_use_bpump(enum)            2
    b_arg: c_bpump_value(X)             200.0
    b_arg: c_use_pitch(enum)            3       # servo on pitch
    b_arg: c_pitch_value(X)             0.4	# 20 degrees

    b_arg: battpos_db(nodim)            .2	# .2 is default 
	
	# Thruster Settings
	# b_arg: use_thruster(enum)   		0  		# 0  Not in use								
    	# b_arg: thruster_value(X)		0    		# use_thruster == 0  None
	
	
	# Arguments for pitch depth controller (depth_ctrl = 2 )
    b_arg: depth_pitch_limit(rad) 		0.26    
    b_arg: depth_gain_scale(bool) 		0 		# whether or not to use X_HOVER_DEPTH_P_GAIN = m * speed + b
    b_arg: depth_p_gain(X) 			-0.0015		# proportional gain: should always be < 0, -.15 default
    b_arg: depth_i_gain(X) 			-0.000005	#integral gain: should be < 0, default: -0.0001
    b_arg: depth_d_gain(X) 			0.1		#derivative gain: should be > 0
    b_arg: depth_pitch_deadband(m/s) 		0.005 		#don't adjust bouyancy until depth rate is less than this, .0349 default
    b_arg: depth_pitch_max_time(s) 		2700		# Max time at maximum u_hover_depth_pitch_limit before we start to adjust ballast
    b_arg: pressure_median(bool) 		1  		# If pressure median should be enabled
    b_arg: battpos_db(nodim) 			1		# How much to scale battpos deadband, f_battpos_db_frac_dz

<end:b_arg>
