package com.comparators;

import java.util.Comparator;

import com.model.Song;

public class LikesComparator implements Comparator<Song> {

	@Override
	public int compare(Song arg0, Song arg1) {
		
		return arg1.getLikes()-arg0.getLikes();
	}

}
