package com.comparators;

import java.util.Comparator;

import com.model.Song;

public class UploadTimeComparator implements Comparator<Song> {

	@Override
	public int compare(Song o1, Song o2) {
		
		if(o1.getUploadingTime().isAfter(o2.getUploadingTime())){
			return 1;
		}
		else{
			if(o1.getUploadingTime().isBefore(o2.getUploadingTime())){
				return -1;
			}
			else{
				return 0;
			}
		}
	}

}
