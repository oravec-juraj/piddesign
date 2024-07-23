

function tf_pid = pt_vec2tf(zr,ti,td)

tf_pid = tf([zr*td, zr, zr/ti],[1 0]);