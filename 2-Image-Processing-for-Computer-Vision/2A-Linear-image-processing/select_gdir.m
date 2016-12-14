function result = select_gdir(gmag, gdir, mag_min, angle_low, angle_hight)
    result = gmag >= mag_min & angle_low <= gdir & gdir & gdir <= angle_hight;
end