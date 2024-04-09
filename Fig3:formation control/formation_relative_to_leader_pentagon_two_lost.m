
function [form_coords, delta_xs, delta_ys] = formation_relative_to_leader_pentagon_two_lost(x_leaders, y_leaders, r)
    num_leaders = size(x_leaders, 1); 
    num_vertices = 5; 
    total_vertices = num_leaders * num_vertices; 
    form_coords = zeros(total_vertices, 2); 
    delta_xs = zeros(total_vertices, 1); 
    delta_ys = zeros(total_vertices, 1); 
    for j = 1:num_leaders
        x_leader = x_leaders(j);
        y_leader = y_leaders(j);
        base_index = (j - 1) * num_vertices; 
     
        for i = 1:num_vertices
            angle_deg = (i - 1) * 72; 
            angle_rad = deg2rad(angle_deg); 

            offsetX = r * cos(angle_rad); 
            offsetY = r * sin(angle_rad); 
            index = base_index + i; % 计算当前顶点在数组中的索引
            form_coords(index, :) = [x_leader + offsetX, y_leader + offsetY]; % 为当前领导者计算队形坐标
            delta_xs(index) = offsetX; % 记录delta_x
            delta_ys(index) = offsetY; % 记录delta_y
        end
    end
end
