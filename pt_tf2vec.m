

function tf_pid = pt_vec2tf(zr,ti,td)

num = tfdata(tf_pid,'v');

kp = num(2);
ki = num(3);
kd = num(1);

zr = kp;
ti = zr/ki;
td = kd/zr;