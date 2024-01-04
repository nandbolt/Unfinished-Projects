/// @desc Water

// Add water
with (other)
{
	water_cnt++;
	if (water_cnt >= max_water_cnt)
	{
		// Change image blend
		image_blend = c_white;
		
		// Check level
		if (lvl < max_lvl)
		{
			// Level up
			lvl++;
			
			// Check if last part
			var _obj_part = oFlowerStem;
			if (lvl == max_lvl)
			{
				_obj_part = oFlowerBud;
			}
			
			// Init part
			var _part = instance_create_layer(x,y-height,"Instances",_obj_part);
			_part.root = self;
			
			// Update root
			flower_arr[flower_idx] = _part;
			height += sprite_height;
			
			// Reset variables
			water_cnt = 0;
		}
	}
}

// Spawn splash
instance_create_layer(x,y,"Instances",oDropletSplash);
instance_create_layer(x,y,"Instances",oDropletSplash);

// Destroy self
instance_destroy();