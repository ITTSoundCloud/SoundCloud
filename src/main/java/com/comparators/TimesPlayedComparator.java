package com.comparators;

import java.util.Comparator;

import com.model.Song;

public class TimesPlayedComparator implements Comparator<Song>{
	
	@Override
	public int compare(Song arg0, Song arg1) {
		
		return arg0.getTimesPlayed()-arg1.getTimesPlayed();
	}


}
