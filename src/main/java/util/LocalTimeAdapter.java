package util;

import java.io.IOException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

public class LocalTimeAdapter extends TypeAdapter<LocalTime> {

    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("HH:mm:ss");

    @Override
    public void write(JsonWriter out, LocalTime value) throws IOException {
        if (value == null) {
            out.nullValue();
            return;
        }
        out.value(value.format(FORMATTER));
    }

    @Override
    public LocalTime read(JsonReader in) throws IOException {
        String str = in.nextString();
        return LocalTime.parse(str, FORMATTER);
    }
}
